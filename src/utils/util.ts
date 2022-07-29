export function verifyEnvVars(): void {

  // List of required envs
  const envVars = [
    'SAMPLE1',
    'SAMPLE2'
  ];

  const missingEnvs: string[] = envVars.filter((envVar) => !process.env[envVar]);

  if (missingEnvs.length > 0) throw new Error(`Envs [${missingEnvs}] is not defined`);
}

export function verifyLinkSlash(url: string): string {
  if (url.substring(url.length - 1) === '/') return url.substring(0, url.length - 1);
  return url;
}
